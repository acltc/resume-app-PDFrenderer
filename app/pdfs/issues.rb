# bounding_box([0, 200], :width => 410) do

#   cell_1 = make_cell(:content => "this row content comes directly ")
#   cell_2 = make_cell(:content => "from cell objects")
#   two_dimensional_array = [ ["..."], ["It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."], ["..."] ]
#   my_table = make_table([ ["..."], ["It is a long established"], ["..."] ])

#   image_path = "#{Prawn::DATADIR}/images/stef.jpg"
#   table([ ["just a regular row", "", "", "blah blah blah"],
#    [cell_1, cell_2, "", ""],
#    ["", "", two_dimensional_array, ""],
#    ["just another regular row", "", "", ""],
#    [{:image => image_path}, "", my_table, ""]])



#   table ([
#     ["It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."],
#     ["this is row two"],
#     ["this is row three"]])
#   end

#   # Table's width was set too small to contain its contents (min width 467.48900000000003, requested 410)