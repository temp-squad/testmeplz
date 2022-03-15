class Admin::CommentsController < Admin::BaseController
  def create
    @exam = Exam.find(params[:exam_id])
    @comment = @exam.comments.create(comment_params)
    @comments = @exam.comments.order("created_at DESC")
  end

  def destroy
    @exam = Exam.find(params[:exam_id])
    Comment.find(params[:id]).destroy
  end
private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
