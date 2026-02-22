class JobsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_job, only: %i[show edit update destroy]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.expect(job: [ :title, :description, :salary ])
    end
end
