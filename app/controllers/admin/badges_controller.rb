class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: %i[show update edit destroy]

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('admin.badges.create.success')
    else
      render :new, notice: t('admin.badges.create.fail')
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_tests_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    if @badge.destroy
      redirect_to admin_tests_path, notice: t('admin.badges.destroy.success')
    else
      flash[:notice] = t('admin.badges.destroy.fail')
    end
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image_name, :rule, :rule_value)
  end
end