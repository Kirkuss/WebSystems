class CollectionNoteAttachmentsController < ApplicationController
  before_action :set_collection_note_attachment, only: [:show, :edit, :update, :destroy]

  # GET /collection_note_attachments
  # GET /collection_note_attachments.json
  def index
    @collection_note_attachments = CollectionNoteAttachment.all
  end

  # GET /collection_note_attachments/1
  # GET /collection_note_attachments/1.json
  def show
  end

  # GET /collection_note_attachments/new
  def new
    @collection_note_attachment = CollectionNoteAttachment.new
  end

  # GET /collection_note_attachments/1/edit
  def edit
  end

  # POST /collection_note_attachments
  # POST /collection_note_attachments.json
  def create
    @collection_note_attachment = CollectionNoteAttachment.new(collection_note_attachment_params)

    respond_to do |format|
      if @collection_note_attachment.save
        format.html { redirect_to @collection_note_attachment, notice: 'Collection note attachment was successfully created.' }
        format.json { render :show, status: :created, location: @collection_note_attachment }
      else
        format.html { render :new }
        format.json { render json: @collection_note_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_note_attachments/1
  # PATCH/PUT /collection_note_attachments/1.json
  def update
    respond_to do |format|
      if @collection_note_attachment.update(collection_note_attachment_params)
        format.html { redirect_to @collection_note_attachment.collection_note, notice: 'Note attachment was successfully updated.' }
      end
    end
  end

  # DELETE /collection_note_attachments/1
  # DELETE /collection_note_attachments/1.json
  def destroy
    @collection_note_attachment.destroy
    respond_to do |format|
      format.html { redirect_to collection_note_attachments_url, notice: 'Collection note attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_note_attachment
      @collection_note_attachment = CollectionNoteAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_note_attachment_params
      params.require(:collection_note_attachment).permit(:collection_note_id, :avatar)
    end
end
