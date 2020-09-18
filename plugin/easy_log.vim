let g:easy_log_map_key = "el"
let g:easy_log_upper_configuration_map = "eL"
let g:easy_log_type_map_key='etl'
let g:easy_log_type_upper_map_key='etL'

let g:easy_log_log_map={
      \'ruby':['puts "', ': " + ', ''],
      \'lua':['print("', ':", ', ')'],
      \}

let g:easy_log_type_map={
      \'ruby':['puts "', '.class: " + ', '.class.to_s'],
      \'lua':['print("type(', '):", type(', '))'],
      \}
