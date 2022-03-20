class Admin::ExamsController < Admin::BaseController
  def index
    @exams = Exam.all.order("created_at DESC")
  end

  def new
  end

  def create
    @exam = ExamService.create(full_name: exam_params[:full_name])

    redirect_to admin_exams_path
  end

  def show
    @exams = Exam.all.order("created_at DESC")
    @exam = Exam.find(params[:id])
  end

private

  def exam_params
    params.require(:exam).permit(:full_name)
  end
end
