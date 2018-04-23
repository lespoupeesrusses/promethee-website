class LocalizationsController < ApplicationController
  before_action :load_data

  layout 'application_with_nav'

  # GET /localizations
  def index
    @localizations = Localization.all
  end

  # GET /localizations/1
  def show
  end

  # GET /localizations/new
  def new
    @localization = Localization.new page_id: params[:page_id]
  end

  # GET /localizations/1/edit
  def edit
  end

  # POST /localizations
  def create
    @localization = Localization.new(localization_params)

    if @localization.save
      redirect_to [@page, @localization], notice: 'Localization was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /localizations/1
  def update
    if @localization.update(localization_params)
      redirect_to [@page, @localization], notice: 'Localization was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /localizations/1
  def destroy
    @localization.destroy
    redirect_to page_localizations_url(page: @page), notice: 'Localization was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_data
      @localization = Localization.find params[:id] if params.include? :id
      @page = Page.find params[:page_id]
    end

    # Only allow a trusted parameter "white list" through.
    def localization_params
      params.require(:localization).permit(:page_id, :data).tap { |permitted| permitted[:data] = JSON.parse(params[:localization][:data]) }
    end
end
