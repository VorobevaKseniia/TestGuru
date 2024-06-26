class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy start update_inline]
  before_action :set_gists, only: %i[index]
  before_action :set_badges, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  def index
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.build(test_params)
    if @test.save
      redirect_to admin_tests_path, notice: t('.success')  # redirect_to [:admin, @test] - other syntax
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('.success')
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
        render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success')
  end

  private
  def test_params
    params.require(:test).permit(:title, :level, :category_id, :timer, :completed)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_gists
    @gists = Gist.all
  end

  def set_tests
    @tests = Test.all
  end
  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def set_badges
    @badges = Badge.all
  end

end
