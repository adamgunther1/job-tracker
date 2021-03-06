class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new
    @contact.company_id = @company.id
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @job = Job.find(params[:id])  
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id]) 
    @job.update(job_params)
    flash.notice = "job '#{@job.title}' Updated!"
    redirect_to company_job_path(@company, @job)
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id]) 
    @job.destroy
    flash.notice = "job '#{@job.title}' Deleted!"
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city_id, :category_id)
  end
end
