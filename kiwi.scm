(define kiwi
  (lambda (expr env)
    (match expr
           [,x (guard (symbol? x))
               (env x)]
           [(lambda (,x) ,body)
            (lambda (arg)
                    (kiwi body (lambda (y)
                                       (if (eq? x y)
                                           arg
                                           (env y)))))]
           [(,rator, rand)
            ((kiwi rator env)
             (kiwi rand env))])))
