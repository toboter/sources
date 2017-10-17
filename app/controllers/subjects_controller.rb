class SubjectsController < ApplicationController
  before_action :set_type
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    sort_order = Subject.sorted_by(params[:sorted_by].presence || 'ident_name_asc')
    @subjects = Subject
      .visible_for(current_user)
      .search (params[:search].presence || '*'), page: params[:page], per_page: session[:per_page], order: sort_order

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show

  end

  # GET /subjects/new
  def new
    @subject = type_class.new(parent_id: params[:parent_id])
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = type_class.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: "#{@type} was successfully created." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: "#{@type} was successfully updated." }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: "#{@type} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_type 
      @type = type 
    end

    def type 
      Subject.types.include?(params[:type]) ? params[:type] : "Subject"
    end

    def type_class 
      type.constantize 
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(type.underscore.to_sym).permit(
        :slug, 
        :identifier_stable, 
        :identifier_temp, 
        :type, 
        :remarks, 
        :parent_id, 
        type_class.jsonb_attributes)
    end
end
