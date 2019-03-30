class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    # Se crea siempre una nueva nota para evitar retornos nulos, los campos de error se generan en un div de la clase field_with_errors y se pueden definir en css usando dicha clase.
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to notes_path
  end

  private
    def note_params
      params.require(:note).permit(:title, :text, :image, :remove_image)
    end
end
