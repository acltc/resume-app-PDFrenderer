class ResumesController < ApplicationController

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
  end

end
