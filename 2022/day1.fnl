(local fennel (require :fennel))

(fn dbg! [x]
  (print (fennel.view x)))

(fn table.sum [table]
  (var sum 0)
  (each [idx elf (pairs table)]
    (set sum (+ sum elf)))
  sum)

(fn table.max [table]
  (var max 0)
  (each [idx elf (pairs table)]
    (if (< max elf)
        (set max elf)))
  max)

(fn table.slice [iter from to]
  (var new-table [])
  (for [idx from to]
    (table.insert new-table (?. iter idx)))
  new-table)

(fn get-elfs []
  (let [max-by-elf {}]
    (var current-elf 1)
    (each [line (io.lines)]
      (if (< (length line) 1)
          (set current-elf (+ 1 current-elf))
          (tset max-by-elf current-elf
                (+ (or (?. max-by-elf current-elf) 0) (tonumber line)))))
    max-by-elf))

(local elfs (get-elfs))
(table.sort elfs (fn [a b]
                   (< b a)))

(local best-three (table.slice elfs 1 3))
(local sum-best-three (table.sum best-three))

(dbg! sum-best-three)

