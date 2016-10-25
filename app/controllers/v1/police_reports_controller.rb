class V1::PoliceReportsController < ApplicationController
  respond_to :json

  def show
    respond_with PoliceReport.find(params[:id])
  end

  def create
    @police_report = PoliceReport.new(police_report_params)

    if @police_report.save
      render json: @police_report, status: 201, location: v1_police_report_url(@police_report)
    else
      render json: { errors: @police_report.errors }, status: 422
    end
  end

  def update
    @police_report = PoliceReport.find(params[:id])

    if @police_report.update(police_report_params)
      render json: @police_report, status: 200, location: v1_police_report_url(@police_report)
    else
      render json: { errors: @police_report.errors }, status: 422
    end
  end

  private

    def police_report_params
      params.require(:police_report).permit(:user_id, :bike_id, :time_discovered_stolen, :status)
    end
end
