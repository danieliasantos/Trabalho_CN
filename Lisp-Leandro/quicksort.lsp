(defun quicksort (lst)
	  (if (null lst) 
	      nil
	      (let* ((x (car lst))
		     (r (cdr lst))
		     (fn (lambda (a) (< a x))))
		(append (quicksort (remove-if-not fn r))
			(list x)
			(quicksort (remove-if fn r))))))
