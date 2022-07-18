(local pkgs [])

(lambda package [name source ?opts]
  (if (= (type ?opts.config) :string)
    (tset ?opts :config (.. :modules.
			    name
			    ?opts.config)))
  (table.insert pkgs source ?opts))
(macro package! [source ?opts]
       (assert-compile (= (type source) :string) "The package's source must be a string" source)
       (assert-compile (or
			 (= ?opts nil)
			 (= (type ?opts) :table))
		       "The package's opts can be either a table or a nil"
		       ?opts)
       `(lambda [name] (package name ,source ,?opts)))

(lambda script [name source ?lazy-load]
  (if (= ?lazy-load nil)
    (require (.. :modules.
		 name))))
(macro script! [source ?lazy-load]
       (assert-compile (= (type source) :string) "The script's source must be a string" source)
       (assert-compile (or
			 (= ?lazy-load nil)
			 (= (type ?lazy-load) :table))
		       "The script's lazy-load options can be either a table or a nil"
		       ?lazy-load)
       `(lambda [name] (script name ,source ,?lazy-load)))

(lambda module-eval [module source name]
  (each [_ func (ipairs source)]
	(func name)))

(macro module! [definition]
       (assert-compile (= (type definition) :table) "Module's definition must be a table" definition)
       (assert-compile (= (type definition.name) :string) "Module's name must be a string" definition.name)
       (assert-compile (= (type definition.description) :string) "Module's description must be a string" definition.description)
       (assert-compile (= (type definition.source) :table) "Module's source must be a table" definition.source)
       (local module {:name definition.name
	      :description definition.description})
       `(module-eval ,module ,definition.source ,module.name))

