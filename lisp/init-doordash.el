;; doordash uses 2 spaces instead of 4 for indentation
;; javascript and json mode indentation with 2
(setq js-indent-level 2)
(setq typescript-indent-level 2)

(defcustom xq/deployment-stage "main-00.staging-us-west-2"
  "Deployment stage for services."
  :group 'xq-deployment-stage
  :type 'string
  :version "24.4")

(setq xq/deployment-stages '(("staging" . "main-00.staging-us-west-2")
                             ("prod" . "main-00.prod-us-west-2")
                             ("sandbox cell 001" . "sandbox-cell-001.prod-main-us-west-2")
                             ("cell 001 00" . "cell-001-00.cell-001.prod-main-us-west-2")))

(setq xq/deployment-stages-helm-source
      `((name . "Deployment Stages")
        (candidates . ,xq/deployment-stages)
        (action . (lambda (candidate)
                    (helm-marked-candidates)))))

(defun xq/helm-select-and-set-deployment-stage()
  (interactive)
  (setq
   xq/deployment-stage
   (mapconcat 'identity
              (helm :sources '(xq/deployment-stages-helm-source))
              ",")))

(defun xq/tsh-tube-login()
  (interactive)
  (shell-command (format "tsh kube login %s" xq/deployment-stage)))


(defcustom xq/kubectl-name-space "catalog-service"
  "Deployment stage for services."
  :group 'xq-kubectl-name-space
  :type 'string
  :version "24.4")

(setq xq/kubectl-name-spaces '(("catalog service" . "catalog-service")
                               ("catalog ml infra" . "nv-catalog-ml-infra")))

(setq xq/kubectl-name-spaces-helm-source
      `((name . "Kubectl Name Spaces")
        (candidates . ,xq/kubectl-name-spaces)
        (action . (lambda (candidate)
                    (helm-marked-candidates)))))

(defun xq/helm-select-and-set-kubectl-name-space()
  (interactive)
  (setq
   xq/kubectl-name-space
   (mapconcat 'identity
              (helm :sources '(xq/kubectl-name-spaces-helm-source))
              ",")))

(defun xq/kubectl-get-pods()
  "Asynchronously get the pods"
  (interactive)
  (async-shell-command (format "kubectl get pods -n %s" xq/kubectl-name-space) "KUBECTL GET PODS" "KUBECTL GET PODS ERRORS"))

(defun xq/kuectl-get-pods-as-helm()
  "Get the pods as a helm buffer for further actions"
  (interactive))

(defun xq/get-logs-from-current-position()
  "get kubectl logs with best effort from curosr"
  (interactive)
  (let* ((cur-pos (move-beginning-of-line()))
         (pod-name-regex (format "%s-[a-zA-Z0-9-]+" xq/kubectl-name-space)))
    (when (re-search-forward pod-name-regex nil t)
      (async-shell-command (format "kubectl logs %s -n %s" (match-string 0) xq/kubectl-name-space) (format "KUBECTL PODS LOG:%s" (match-string 0))))))

(provide 'init-doordash)
