(local fennel (require :fennel))

(fn dbg! [x]
  (let [fennel (require :fennel)]
    (print (fennel.view x))))

(fn table-sum [table ?mapper]
  (var sum 0)
  (each [idx elf (pairs table)]
    (set sum (+ sum (match ?mapper
                      nil elf
                      _ (?mapper elf)))))
  sum)

(fn table-slice [iter from to]
  (var new-table [])
  (for [idx from to]
    (table.insert new-table (?. iter idx)))
  new-table)

(fn table-slice [iter from to]
  (var new-table [])
  (for [idx from to]
    (table.insert new-table (?. iter idx)))
  new-table)

(fn table-map [iter mapper]
  (var new-table [])
  (each [line iter]
    (table.insert new-table (mapper line)))
  new-table)

{ :value { :dbg! dbg! } 
  :table { 
    :sum table-sum 
    :slice table-slice 
    :map table-map }}
