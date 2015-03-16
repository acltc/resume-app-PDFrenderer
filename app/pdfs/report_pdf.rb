class ReportPdf < Prawn::Document

  def initialize(student)
    super()
    @student = student
    header
    text_content
    # table_content
    puts "*******************************"
    p @student.id
    
  end

  
 
  def header
    #This inserts an image in the pdf file and sets the size of the image
    # image "#{Rails.root}/app/assets/images/Stacked_wood.JPG", width: 150, height: 150
    #On it's own, this doesn't position anything in header
    #y_position = cursor - 100
     
    text "#{@student.full_name}", size: 30, style: :bold 
    text "#{@student.email} #{@student.phone_number} #{@student.blog} #{@student.github} #{@student.linkedin}" , size: 10 
    stroke_horizontal_rule
    

  end
 
  def text_content
    
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 30
    gap = 10
    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 512, :height => 144) do
      transparent(0.5) { stroke_bounds }
      text "SKILLS", size: 12, style: :bold
      
      # bounding_box([0, cursor - gap], :width => 490, :height => 100) do
        font_size 10
        pad_top(10){
      text "Pad_top with text. No nested bounding box. Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per himenaeosAliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per himenaeos." }
      # end
      
    end

    y_position = cursor - 30
    gap = 10
    bounding_box([0, y_position], :width => 512, :height => 288) do
      transparent(0.5) { stroke_bounds }

      text "EXPERIENCE", size: 12, style: :bold 
      pad_top(10) {
      text "Job Title" 
      text "Company Name" "start-end" }

      bounding_box([gap, cursor - gap], :width => 490) do
        font_size 10
         text "Nested bounding box Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."
      end
      
    end

    y_position = cursor - 30
    gap = 10
    bounding_box([0, y_position], :width => 512, :height => 108) do
      transparent(0.5) { stroke_bounds }
      text "EDUCATION", size: 12, style: :bold
      text "University name"

      bounding_box([gap, cursor - gap], :width => 490, :height => 90) do
        font_size 10
      text "Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor."
      end
    end
 
  end
 
  # def table_content
  #   # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
  #   # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
  #   # Then I set the table column widths
  #   table product_rows do
  #     row(0).font_style = :bold
  #     self.header = true
  #     self.row_colors = ['DDDDDD', 'FFFFFF']
  #     self.column_widths = [40, 300, 200]
  #   end
  # end
 
  def product_rows
    [['#', 'Name', 'Price']] +
      @wood.map do |product|
      [product.id, product.dimensions, product.sizes]
    end
  end
end




