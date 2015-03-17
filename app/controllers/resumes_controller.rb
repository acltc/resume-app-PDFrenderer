class ResumesController < ApplicationController

  # def index

  #   @student = Resume.find("1")

  #       respond_to do |format|
  #         format.html
  #         # format.json { render json: @wood }
  #         format.pdf do
  #           pdf = ReportPdf.new(@student)
  #           send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
  #         end

  #       end

      
  # end
  def index
  end

  def show
    @student = Resume.find(params[:id])
        respond_to do |format|
              format.html
              format.pdf do
                pdf = ReportPdf.new(@student)
                send_data pdf.render, type: 'application/pdf', disposition: "inline"
              end
           end


        # respond_to do |format|
        #   format.html
        #   # format.json { render json: @wood }
        #   format.pdf do
        #     pdf = ReportPdf.new(@student)
        #     send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
        #   end

        # end

  end

end
