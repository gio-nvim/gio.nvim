(local module_table {})

(macro inbuilt! [module description]
  `(tset module_table ,module {:description ,description :enabled true}))

(lambda format_file_string [name max_length description enabled]
  (.. 
    " "
    (if enabled "" ";;")
    (string.format ":%s%s;; %s"
		   name
		   (string.rep " " (- max_length (length name) -1))
		   description)))

(lambda generate []
  ;; Create a string that looks like config/fnl/modules/
  (local module_path (-> :config
			 (vim.fn.stdpath)
			 (.. :/fnl/modules/)
			 (string.gsub :\ :/)))
  ;; create fnl/modules/* string
  ;; expand that string
  ;; make path all platforms-compatible
  ;; remove config/fnl/modules/ from expanded string
  ;; turn expanded string into list of modules
  (local modules (-> module_path
		     (.. :*)
		     (vim.fn.expand)
		     (string.gsub :\ :/)
		     (string.gsub module_path "")
		     (vim.split "\n")))

  ;; disable every module
  (each [_ module (ipairs modules)]
	(if (not (= module ""))
	  (tset module_table module {:enabled false})))

  ;; preconfigure default modules
  ;; TODO: fetch description from module metadata
  ;;(inbuilt! :notes "Module that sets up note-taking stuff")
  ;;(inbuilt! :colors "Module that sets up color-related stuff")

  ;; Get the max length of module name
  (var max_module_name_length 0)
  (each [name _ (pairs module_table)]
	(->> name
	     (length)
	     (math.max max_module_name_length)
	     (set max_module_name_length)))

  ;; create the files tring
  (local file_strings [])
  (table.insert file_strings "[")
  (each [name metadata (pairs module_table)]
	(table.insert file_strings (format_file_string
				     name
				     max_module_name_length
				     metadata.description
				     metadata.enabled)))
  (table.insert file_strings "]")
  (local file_string (table.concat file_strings "\n"))

  ;; write file contents
  (let [composer-file
	 (-> :config
	     (vim.fn.stdpath)
	     (.. :/fnl/composer.fnl)
	     (io.open :w+))
	 gitignore-file
	 (-> :config
	     (vim.fn.stdpath)
	     (.. :/fnl/.gitignore)
	     (io.open :w+))]
    (composer-file:write file_string)
    (composer-file:close)
    (gitignore-file:write :!composer.fnl)
    (gitignore-file:close)))

;; require every module in list
(lambda compose [modules]
  (each [_ module (ipairs modules)]
	(->> module
	     (.. :modules.)
	     (require))))

{: generate : compose}
