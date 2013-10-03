#lang slideshow

(require slideshow/play
         slideshow/code
         slideshow/latex
         (for-syntax syntax/stx)
         "slideshow-macros.rkt")

(title-slide
 (scale (bitmap "python-logo.gif") 4)
 (colorize (medium-text "Leif Andersen") "blue")
 (colorize (t "University of Utah") "red"))

(picture-slide
 (scale (bitmap "grading.gif") 1.5)
 (massive-text "Factorial"))

(section
 #:title "Factorial"

 (pretty-slide
  (scode "def fact(n):
    tmp = 1
    i = 1
    while(i <= n):
        tmp *= i
        i += 1
    return tmp"))

 (pretty-slide
  (scode "def fact(n):
    tmp = 1
    for i in range(1, n+1):
        tmp *= i
    return tmp"))

 (pretty-slide
  (scode "def fact(n):
    if n <= 0:
        return 1
    else:
        return n * fact(n - 1)"))
 (pretty-slide
  (scode "def fact_h(n, acc)
    if n <= 0:
        return acc
    else:
        return fact(n-1, acc*n)

def fact(n):
    return fact(n, 1)"))
 (pretty-slide
  (scode "def fact(n):
    def f(n, acc):
        if n <= 0:
            return acc
        else:
            return f(n-1, acc*n)
    return f(n, 1)"))
 )

(pretty->flip-slide
 (massive-text "Importing Files"))

(section
 #:title "Importing Files"
 (flip->pretty-slide
  #:fade-out #f
  (scale (scode "import sys
import os
...
import math") 2))

 (transition-acronym-slide
  #:acronym (scale( scode "import sys") 2)
  #:reversed #t
  (scale (scode "import sys ") 2)
  (scale (scode "import os  ") 2)
  (scale (scode "...        ") 2)
  (scale (scode "import math") 2))

 (header-slide
  #:fade-in #f
  #:fade-out #f
  #:header (scale (scode "import sys") 2)
  (scale (scode "print(sys.argv[1])") 2))

 (transition-slide
  #:reversed #t
  #:header (scale (scode "import sys") 2)
  (scale (scode "print(sys.argv[1])") 2))

 (slide
  (scale (scode "import sys") 2))

 (transition-insert-slide
  #:reversed #t
  #:insert (scale (scode "import") 2)
  #:right (scale (scode " sys") 2))

 (transition-insert-slide
  #:insert (scale (scode "from") 2)
  #:right (scale (scode " sys") 2))

 (transition-insert-slide
  #:left (scale (scode "from sys") 2)
  #:insert (scale (scode " import argv") 2))

 (header-slide
  #:fade-in #f
  #:fade-out #f
  #:header (scale (scode "from sys import argv") 2)
  (scale (scode "print(argv[0])") 2))

 (transition-slide
  #:reversed #t
  #:header (scale (scode "from sys import argv") 2)
  (scale (scode "print(argv[0])") 2))

 (shrink-transition-slide
  #:start-size 2
  #:end-size 1.5
  (scode "from sys import argv"))

 (transition-slide
  #:append 'left
  #:header (scale (scode "from sys import argv") 1.5)
  (scale (scode " as myargs") 1.5))

 (header-slide
  #:fade-in #f
  #:header (scale (scode "from sys import argv as myargs") 1.5)
  (scale (scode "print(myargs[0])") 1.5))
 )

(pretty-slide
 (massive-text "Classes"))

(section
 #:title "Classes"

 (pretty->flip-slide
  (scale (scode "class <name>:
    <body>") 2))

 (flip->pretty-slide
  (scale (scode "class Vector:
    x = 0
    y = 0") 2))

 (header-slide
  #:header (large-text "Methods in classes")
  (hc-append 0
             (medium-text "Requires ")
             (scale (scode "self") 2)
             (medium-text " argument")))

 (header-slide
  #:append 'top-l
  #:header (scale (scode "class Vector:
    x = 0
    y = 0") 1)
 (scale (scode "    def magnitude(self):
        return math.sqrt(self.x**2 + self.y**2)") 1))

 (header-slide
  #:header (large-text "Calling class methods")
  (hc-append 0
             (medium-text "Does ")
             (colorize (medium-text "NOT") "red")
             (medium-text " Require ")
             (scale (scode "self") 2)
             (medium-text " argument")))

 (header-slide
  #:append 'top-l
  #:header (scale (scode "class Vector:
    x = 0
    y = 0
    def magnitude(self):
        return math.sqrt(self.x**2 + self.y**2)") 1)
  (scale (scode "    def normalize(self):
        self.x /= self.magnitude()
        self.y /= self.magnitude()") 1))

 (pretty-slide
  (medium-text "Methods can take other arguements too"))

 (header-slide
  #:append 'top-l
  #:header (scale (scode "class Vector:
    x = 0
    y = 0
    def magnitude(self):
        return math.sqrt(self.x**2 + self.y**2)
    def normalize(self):
        self.x /= self.magnitude()
        self.y /= self.magnitude()") 1)
  (scale (scode "    def angle(self, other):
        return acos((self.x*other.x
                     + self.y*other.y)
                    / (self.magnitude()
                       * other.magnitude()))") 1))

 (pretty->flip-slide
  (large-text "Instantiating Classes"))

 (flip->pretty-slide
  #:fade-out #f
  (scale (scode "v = Vector()") 3))

 (transition-insert-slide
  #:left   (scale (scode "v = Vector(") 3)
  #:insert (scale (scode "5, 3") 3)
  #:right  (scale (scode ")") 3))

 (pretty->flip-slide
  #:fade-in #f
  (scale (scode "v = Vector(5, 3)") 3))

 (flip-slide
  (scale (scode "def __init__(self, ...)") 2))

 (flip->pretty-slide
  (scale (scode "class Vector:
    x = 0
    y = 0
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def magnitude(self):
        ...
    def normalize(self):
        ...
    def angle(self, other):
        ...") 1))

 (header-slide
  #:header (medium-text "Class take arbitrary code")
  (scale (scode "class Foo:
    while True: pass") 1.5))
 )

(pretty-slide
 (large-text "List Comprehensions"))

(section
 #:title "List Comprehensions"
 (pretty->flip-slide
  (scale (scode "x = []
for i in range(10):
    x.append(i*2)") 2))

 (flip->pretty-slide
  #:fade-out #f
  (scale (scode "x = [i*2 for i in range(10)]") 1.5))

 (shrink-transition-slide
  #:start-size 1.5
  #:end-size 1
  (scode "x = [i*2 for i in range(10)]"))

 (transition-insert-slide
  #:reversed #t
  #:left   (scale (scode "x = [") 1)
  #:insert (scale (scode "i*2") 1)
  #:right  (scale (scode " for i in range(10)]") 1))

 (transition-insert-slide
  #:left   (scale (scode "x = [") 1)
  #:insert (scale (scode "[(i, j) for j in range(10)]") 1)
  #:right  (scale (scode " for i in range(10)]") 1))

 (header-slide
  #:fade-in #f
  #:header (scale (scode "x=[[(i, j) for j in range(10)] for i in range 10]") 1)
  (scale (scode "[[(0, 0), (0, 1), ..., (0. 9)],
 [(1, 0), (1, 1), ..., (1, 9)],
 ...
 [(9, 0), (9, 1), ..., (9, 9)]]") 1.5))

 (pretty-slide
  (scale (scode "x = {fib(i) for i in range(10)}") 1.5))

 (pretty-slide
  (scale (scode "x = {i:i+1 for i in {1, 8, 10, 50}}") 1.5))
 )

(pretty->flip-slide
 (large-text "Basic Python File"))

(flip->pretty-slide
 (scode "#!/usr/bin/env python3

def main():
    pass

if __name__ == '__main__':
    main()"))

(picture-slide
 (scale (bitmap "pygame_tiny.png") 4)
 (scode "#!/usr/bin/env python
import sys, pygame
pygame.init()
...
def main():
    init()
    while True:
        pygame.time.delay(10)
        events()
        move()
        draw()

if __name__ == '__main__':
    main()"))

(picture-slide
 (massive-text "Next time:")
 (scale (bitmap "ruby.gif") 2))

(header-slide
 #:header (massive-text "Questions?")
 (colorize (large-text "leif@leifandersen.net") "blue"))
