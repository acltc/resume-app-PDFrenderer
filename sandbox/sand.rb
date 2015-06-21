require 'prawn'

Prawn::Document.generate("implicit.pdf") do
  text "Hello World"
end

# ###########
# the below code is from once I got the pdf to look kind of like I wanted then I started to clean it up

require "prawn/measurement_extensions"
require 'prawn/table'

class ReportPdf < Prawn::Document
  def initialize(student)

    super(:left_margin => 60, :right_margin => 60)
    @student = student
    header
    skills
    education
    experience
    # table_content
    p @student.experiences
    # binding.pry
  end
 
  def header
    stroke_axis
    self.line_width = 1

    text "#{@student.full_name}", size: 30, style: :bold, color: "17A396" 
    header_data = [
      ["#{@student.email}", "#{@student.phone_number}", "#{@student.blog}", "#{@student.github}", "#{@student.linkedin}"]
    ]

    table(header_data, :width => 550, :cell_style => { :borders => [], :padding => [0, 0, 0, 0], :size => 12, :text_color => "17A396", :font_style => :bold })
    
    # fill_color "9BE466"
    # fill_rectangle [0, 100], 500, 100

    # fill_color "000000"
    # stroke_color "ffffff"
    # base_x = 100
    # [[0.5, 1], 0.5, [1, 0.5]].each do |args|
    #  transparent(*args) do
    #  fill_circle [base_x, 100], 50
    #  stroke_rectangle [base_x - 20, 100], 80, 40
    #  end
    #  base_x += 150
    # end
    
    # circle [400,400], 20
    stroke_color "#A7C8DB"
    stroke_horizontal_rule 
    # move_down 50
    # text "the cursor is here: #{cursor}"
    # text "now it is here: #{cursor}"
    # rounded_rectangle [300,300], 100, 200, 10
    # fill_color "ffffff"
    #   rounded_rectangle [300,300], 100, 200, 10
    # # fill_and_stroke_rounded_polygon(10, [100, 250], [200, 300], [300, 250],
    #                 # [300, 150], [200, 100], [100, 150])
    # stroke_circle [0, 0], 10

    # stroke_horizontal_rule
    # pad(20) { text "Text padded both before and after." }

    # stroke_horizontal_rule
    # pad_top(20) { text "Text padded on the top." }

    # stroke_horizontal_rule
    # pad_bottom(20) { text "Text padded on the bottom." }

    # stroke_horizontal_rule
    # move_down 30
    # stroke_rectangle [100, 100], 100, 15
  end # end of header

  
 
  def skills
    font_size 10
    rotate(90, :origin => [24, 459]) { 
        font_size 12
        fill_color "17A396"
        transparent(0.2) { fill_rectangle [100, 100], 120, 14 }
        text_box "SKILLS", :at => [100, 97.5], :width => 120, :align => :center
      }
    # gap seems to be the indentation of the body of text
    gap = 30
    # y_position = 680
    bounding_box([400, 680], :width => 100) do
          # transparent(0.5) { stroke_bounds }

    pad_top(20) {
      @student.skills.each do |x|
        pad(5) { text "#{x["skill_name"]}" }
        # stroke_color "#A7C8DB"
        stroke_horizontal_rule 
      end
      }
    # text "\u2022 Ruby on Rails"
    # text "\u2022 REST"
    # text "\u2022 Listening to Jay's lectures"
    # text "\u2022 Another skill"
    # text "\u2022 More skills, more space, how long until next "
    # text "\u2022 More skills"
         
  end #End skills bounding box

#don't touch the code below, it is where is needs to be
    

    rotate(90, :origin => [-167, 268]) { 
        font_size 12
        fill_color "17A396"
        transparent(0.2) { fill_rectangle [100, 100], 120, 14 }
        text_box "EDUCATION", :at => [100, 97.5], :width => 120, :align => :center
      }

      rotate(90, :origin => [-49, 150]) { 
          font_size 12
          fill_color "17A396"
          transparent(0.2) { fill_rectangle [100, 100], 120, 14 }
          text_box "EXPERIENCE", :at => [100, 97.5], :width => 120, :align => :center
        }
# # # # # # #



    def education
      font_size 10
      
      bounding_box([15, 680], :width => 290) do
        pad_top(25) {
          @student.educations.each do |education|
            education["details"].each do |detail|
          table([ ["#{convert_to_year(education["start_date"])} - #{convert_to_year(education["end_date"])}", {:content => "#{education["degrees"]}", :font_style => :bold, :text_color => "17A396" } ],
                  ["", "#{education["university_name"]}"],
                  ["", "#{detail["detail"]}"] ],
                  :cell_style => { :border_lines => [:dotted], :borders => [], :padding => [0, 0, 1, 10] }, :column_widths => {0 => 65})
          move_down 10
            end
          end
        } 
      end

      

      # @student.educations.each do |x|  
      #   text "#{convert_to_year(x["start_date"])} - #{convert_to_year(x["end_date"])}   #{x["degrees"].upcase}" 
        
      #   text "#{x["university_name"].upcase}"
      # end 
      # x = 100
      # y = 97.5
      # one = @student.educations[0]
      # text_box "#{one["degrees"]}", :at => [x, y], :width => 120, :align => :center
#sweet the code below works
      # @student.educations.each do |year|
      #   text_box "#{convert_to_year(year["start_date"])} - #{convert_to_year(year["end_date"])}", :at => [x, y], :width => 120, :align => :center
      #   y += 15
      #   text_box "#{year["degrees"].upcase} #{year["university_name"].upcase}", :at => [200, y - 15], :width => 180
      #   text_box "#{year["university_name"].upcase}", :at => [215, y - 30], :width => 180
      # end

      # table([ ["#{one["degrees"]}", "#{one["degrees"]}", "#{one["university_name"]}"],
      #  ["short", "loooooooooooooooooooong", "short"],
      #  ["loooooooooooooooooooong", "short", "short"] ])

# move_down 30

#       bounding_box([25, cursor - 0], :width => 100, :height => 150) do
#        text "Just your regular bounding box"
#        transparent(0.5) { stroke_bounds }
#       end

#       bounding_box([130, 622], :width => 200, :height => 150) do
#        text "Second regular", :valign => :bottom
#        transparent(0.5) { stroke_bounds }
#       end

    end #End education bounding box
    
    
        
    
    def experience
      font_size 10
      
      bounding_box([15, 443], :width => 450) do
        
        pad_top(25) {
          @student.experiences.each do |experience|
            
          table([ ["#{convert_to_year(experience["start_date"])} - #{convert_to_year(experience["end_date"])}", {:content => "#{experience["job_title"]}", :font_style => :bold, :text_color => "17A396" } ],
                  ["", "#{experience["company_name"]}"],
                  ["", "details go here"] ],
                  :cell_style => { :border_lines => [:dotted], :borders => [], :padding => [0, 0, 1, 10] }, :column_widths => {0 => 65})
          move_down 10
            
          end
        } 
      end
    end #End experience

 
  end

  private

  def convert_to_year(date)
    date[/\d{4}/]
  end

end

# this is pretty cool header with icons, i just think it looks weird
stroke_axis
github = "app/assets/images/showimage.jpg"
phone = "app/assets/images/phone.jpg"
mail = "app/assets/images/mail.jpg"
www = "app/assets/images/world.jpg"

self.line_width = 1

text "#{@student.full_name}", size: 30, style: :bold, color: "17A396" 
header_data = [
  [{:image => mail, :scale => 0.07}, "#{@student.email}", {:image => phone, :scale => 0.03}, "#{@student.phone_number}", {:image => www, :scale => 0.14}, "#{@student.blog}", {:image => github, :scale => 0.08}, "#{@student.github}"]
]

table(header_data, :width => 490, :cell_style => { :padding => [0, 0, 0, 3], :borders => [], :size => 12, :text_color => "17A396", :font_style => :bold })

# this is pretty cool
def footer
  move_down 10
  stroke_color "#A7C8DB"
  stroke_horizontal_rule

  header_data = [
    ["#{@student.email}", {:content => "#{@student.phone_number}", :align => :center }, {:content => "#{@student.blog}", :align => :right }]
  ]

  table(header_data, :width => 492, :cell_style => { :padding => [0, 0, 0, 3], :borders => [], :size => 12, :text_color => "17A396", :font_style => :bold })
end



