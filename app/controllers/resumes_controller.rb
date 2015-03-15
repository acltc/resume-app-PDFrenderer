class ResumesController < ApplicationController

  def index

    @wood = Resume.all


        respond_to do |format|
          format.html
          # format.json { render json: @wood }
          format.pdf do
            pdf = ReportPdf.new(@wood)
            send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
          end

        end

      
  end

end
