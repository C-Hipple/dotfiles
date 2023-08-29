;; copy/pasted out of my .spacemacs temp while i troubleshoot some other things

;; define "R" as the prefix key for reviewing what happened in various
;; time periods
(setq org-agenda-custom-commands
      '(("c" "Work" tags-todo "work" ;; (1) (2) (3) (4)
         ((org-agenda-files '("~/gtd/inbox.org" "~/gtd/gtd.org" "~/gtd/notes.org" "~/gtd/next_actions.org")) ;; (5)
          (org-agenda-sorting-strategy '(priority-up effort-down))) ;; (5) cont.
         ("~/computer.html")) ;; (6)
        ;; ...other commands here
        ))

(add-to-list 'org-agenda-custom-commands
             '("R" . "Review" )
             )

  ;; Common settings for all reviews
  (setq efs/org-agenda-review-settings
      '((org-agenda-files '("~/gtd/notes.org"
                            "~/gtd/someday.org"
                            "~/gtd/gtd.org"
                            "~/gtd/inbox.org"
                            "~/gtd/next_actions.org"
                            ))
        (org-agenda-show-all-dates t)
        (org-agenda-start-with-log-mode t)
        (org-agenda-start-with-clockreport-mode t)
        (org-agenda-archives-mode t)
        ;; I don't care if an entry was archived
        (org-agenda-hide-tags-regexp
         (concat org-agenda-hide-tags-regexp
                 "\\|ARCHIVE"))
      ))
  ;; Show the agenda with the log turn on, the clock table show and
  ;; archived entries shown.  These commands are all the same exept for
  ;; the time period.
  (add-to-list 'org-agenda-custom-commands
             `("Rw" "Week in review"
                agenda ""
                ;; agenda settings
                ,(append
                  efs/org-agenda-review-settings
                  '((org-agenda-span 'week)
                    (org-agenda-start-on-weekday 0)
                    (org-agenda-overriding-header "Week in Review"))
                  )
                ("~//review/week.html")
                ))


  (add-to-list 'org-agenda-custom-commands
             `("Rd" "Day in review"
                agenda ""
                ;; agenda settings
                ,(append
                  efs/org-agenda-review-settings
                  '((org-agenda-span 'day)
                    (org-agenda-overriding-header "Day in Review"))
                  )
                ("~//review/day.html")
                ))

  (add-to-list 'org-agenda-custom-commands
             `("Rm" "Month in review"
                agenda ""
                ;; agenda settings
                ,(append
                  efs/org-agenda-review-settings
                  '((org-agenda-span 'month)
                    (org-agenda-start-day "01")
                    (org-read-date-prefer-future nil)
                    (org-agenda-overriding-header "Month in Review"))
                  )
                ("~//review/month.html")
                ))
