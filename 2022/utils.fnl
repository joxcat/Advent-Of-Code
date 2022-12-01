(local fennel (require :fennel))

(fn dbg! [x]
  (let [fennel (require :fennel)]
    (print (fennel.view x))))

(fn table.sum [table]
  (var sum 0)
  (each [idx elf (pairs table)]
    (set sum (+ sum elf)))
  sum)

(fn table.slice [iter from to]
  (var new-table [])
  (for [idx from to]
    (table.insert new-table (?. iter idx)))
  new-table)

