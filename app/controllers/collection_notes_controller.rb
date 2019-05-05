class CollectionNotesController < ApplicationController
  before_action :set_collection_note, only: [:show, :edit, :update, :destroy]

  # GET /collection_notes
  # GET /collection_notes.json
  def index
    @collection_notes = CollectionNote.all

  end

  # GET /collection_notes/1
  # GET /collection_notes/1.json
  def show
    @collection_note_attachments = @collection_note.collection_note_attachments.all
  end

  # GET /collection_notes/new
  def new
    @collection_note = CollectionNote.new
    @collection_note_attachment = @collection_note.collection_note_attachments.build
    @collection = Collection.find(params[:collection_id])

  end

  # GET /collection_notes/1/edit
  def edit
    @collection_note = CollectionNote.find(params[:id])
  end

  # POST /collection_notes
  # POST /collection_notes.json
  def create
   @collection_note = CollectionNote.new(collection_note_params)
    @collection_note.user = User.find_by name: session[:user]
    @collection_note.collection = Collection.find(params[:collection_id])
    respond_to do |format|
      if @collection_note.save
        if params[:collection_note_attachments]
        params[:collection_note_attachments]['avatar'].each do |a|
          @collection_note_attachment = @collection_note.collection_note_attachments.create!(:avatar => a)
        end
       end
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @collection_note }
      else
        format.html { render :new }
        format.json { render json: @collection_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_notes/1
  # PATCH/PUT /collection_notes/1.json
  def update
    respond_to do |format|
      if @collection_note.update(collection_note_params)
        format.html { redirect_to @collection_note, notice: 'Collection note was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection_note }
      else
        format.html { render :edit }
        format.json { render json: @collection_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_notes/1
  # DELETE /collection_notes/1.json
  def destroy
    @collection_note.destroy
    respond_to do |format|
      format.html { redirect_to notes_path, notice: 'Collection note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_note
      @collection_note = CollectionNote.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_note_params
      params.require(:collection_note).permit(:text, :user_id, :collection_id)

    end
end
