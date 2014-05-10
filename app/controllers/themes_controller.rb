class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  # GET /themes
  # GET /themes.json
  def index
    @themes = Theme.all
  end

  # GET /themes/1
  # GET /themes/1.json
  def show
  end

  def new
    @theme = Theme.new
    @theme.theme_kbn = params[:theme_kbn] || 1
    if @theme.theme_kbn == 1       
      woman = Woman.create
      @theme.woman_id = woman.id
    else
      @theme.woman_id = params[:woman_id]
    end
  end

  def edit
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      if @theme.theme_kbn >= 5
        redirect_to "/pages/complete" and return
        #redirect_to edit_woman_path(@theme.woman_id)
      end
      theme_kbn = @theme.theme_kbn + 1
      redirect_to new_theme_path(:theme_kbn => theme_kbn, :woman_id => @theme.woman_id)
    else
      render :new
    end
  end

  def skip
    theme_kbn = params[:theme_kbn] || 1
    woman_id = params[:woman_id]
    theme_kbn = theme_kbn.to_i
    if theme_kbn >= 5
      #redirect_to edit_woman_path(woman_id) and return
      redirect_to "/pages/complete" and return
    end
    theme_kbn += 1
    redirect_to new_theme_path(:theme_kbn => theme_kbn, :woman_id => woman_id)
  end

  # PATCH/PUT /themes/1
  # PATCH/PUT /themes/1.json
  def update
    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to @theme, notice: 'Theme was successfully updated.' }
        format.json { render :show, status: :ok, location: @theme }
      else
        format.html { render :edit }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /themes/1
  # DELETE /themes/1.json
  def destroy
    @theme.destroy
    respond_to do |format|
      format.html { redirect_to themes_url, notice: 'Theme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theme_params
      params.require(:theme).permit(:woman_id, :theme_kbn, :photo)
    end
end
