(lambda composer [modules]
  (each [_ module (ipairs modules)]
	(require (.. "modules." module))))

composer
