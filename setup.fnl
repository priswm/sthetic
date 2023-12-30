;; Define the folder pairs (source folder and destination folder)
(local folder-pairs 
  [{:destination :/home/jsg/.sthetic/progs/awesome
    :source      :/home/jsg/.config/awesome}
   {:destination :/home/jsg/.shetic/progs/lite-xl
    :source      :/home/jsg/.config/lite-xl}
   {:destination :/home/jsg/.sthetic/progs/luakit
    :source      :/home/jsg/.config/luakit/}])

;; Function to create a static link
(fn create-static-link [source-path destination-path]
  ;; Check if the source path exists
  (let [file-attributes (lfs.attributes source-path)]
    (when (= file-attributes nil)
      (print (.. "Source path does not exist: " source-path))
      (lua "return "))

    ;; Create the static link
    (local command (.. "ln -s '" source-path "' '" destination-path "'"))
    (local result (os.execute command))
    (if (= result 0) (print (.. "Static link created: " destination-path))
        (print (.. "Failed to create static link: " destination-path)))))

;; Create static links for the folder pairs
(each [_ pair (ipairs folder-pairs)]
  (create-static-link pair.source (.. pair.destination :/source))
  (create-static-link pair.destination (.. pair.source :/destination)))	
