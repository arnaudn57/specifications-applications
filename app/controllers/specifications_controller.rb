class SpecificationsController < ApplicationController
  before_action :set_specification, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :destroy]

  def new
    @specification = Specification.new
  end

  def create
    @specification = Specification.new(specification_params)
    @specification.token = SecureRandom.hex(10)
    @specification.step = 1

    if @specification.save
      redirect_to edit_specification_path(@specification), notice: 'Cahier des charges créé et envoyé au client.'
    else
      render :new
    end
  end

  def show
    if user_signed_in? || !token_expired?(@specification)
      render :show
    else
      @expirate_message = 'Le cahier des charges a expiré.'
    end
  end

  def edit
     if user_signed_in?
      render "edit_step_#{@specification.step}"
    end

    return
 # Si dans l'ul le paramamtre token existe et qu'il nest pas perimé alors affiché la page
    if params[:token].present? && params[:token] == @specification.token && !token_expired?(@specification)
        render "edit_step_#{@specification.step}"
    else
        redirect_to root_path, alert: 'Le lien a expiré.'
    end


  end

  def update
  if user_signed_in? || !token_expired?(@specification)

    if @specification.update(specification_params)
      if params[:commit] == "Suivant"
        @specification.step += 1
      elsif params[:commit] == "Précédent"
        @specification.step -= 1
      end

      if @specification.save
        redirect_to edit_specification_path(@specification, token: @specification.token)
      else
        flash[:error] = "Erreur lors de la sauvegarde de la spécification."
        render "edit_step_#{@specification.step}"
      end
    else
      render "edit_step_#{@specification.step}"
    end
  else
    @expirate_message = 'Le cahier des charges a expiré.'
    render :show
  end
end


  def destroy
    @specification.destroy
    respond_to do |format|
      format.html { redirect_to specifications_url, notice: 'Spécification supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  private

  def specification_params
    params.require(:specification).permit(:title, :description, :client_email, :token_expiry, :enseigne, :raison_sociale, :forme_juridique, :activite, :rcs, :code_ape, :siret, :siren, :tva_intra, :adresse_societe, :ville_societe, :cp_societe, :tel_societe, :mail_societe, :nom_gerant, :prenom_gerant, :tel_gerant, :gsm_gerant, :mail_gerant, :nom_responsable, :prenom_responsable, :tel_responsable, :gsm_responsable, :mail_responsable, :prevu_ouverture, :prevu_installation, :step)
  end

  def set_specification
    @specification = Specification.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to dashboards_path, alert: 'Spécification non trouvée.'
  end

  def token_expired?(specification)
    specification.token_expiry < Time.now
  end
end
