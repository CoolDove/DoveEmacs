(use-package web-search
  :ensure t
  :config
  (setq web-search-default-provider "Bing"))

(require 'web-search)
(push (list "Bili" "https://search.bilibili.com/all?keyword=%s" "Code") web-search-providers)
(push (list "UnityDoc2019.4" "https://docs.unity3d.com/2019.4/Documentation/ScriptReference/30_search.html?q=%s" "Code") web-search-providers)
(push (list "UnityDoc2020.3" "https://docs.unity3d.com/2020.3/Documentation/ScriptReference/30_search.html?q=%s" "Code") web-search-providers)
(push (list "UnityDoc2021.2" "https://docs.unity3d.com/2021.2/Documentation/ScriptReference/30_search.html?q=%s" "Code") web-search-providers)

(defun dws-last ()
  (interactive)
  (call-interactively #'web-search)
)

(defmacro dws-register-provider (symb name)
	`(defun ,(intern (format "dws-%s" symb))
		()
		,`(interactive)
			(setq web-search-default-provider ,name)
			(call-interactively #'web-search))
)

(dws-register-provider Bing "Bing")
(dws-register-provider Google "Google")
(dws-register-provider Wiki "Wikipedia")

(dws-register-provider GitHub "GitHub")
(dws-register-provider Gist "Gist")

(dws-register-provider Zhihu "Zhihu")
(dws-register-provider Bili "Bili")
(dws-register-provider StackOF "Stack Overflow")
(dws-register-provider Youtb "YouTube")
(dws-register-provider Reddit "Reddit")
(dws-register-provider HackerNews "Hacker News")

(dws-register-provider UnityDoc2019.4 "UnityDoc2019.4")
(dws-register-provider UnityDoc2020.3 "UnityDoc2020.3")
(dws-register-provider UnityDoc2021.2 "UnityDoc2020.2")

(provide 'dove-web-search)
