class SpecificationsController < ApplicationController
  before_action :set_specification, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :update, :destroy]

  def new
    @specification = Specification.new
  end

  def create
    @specification = Specification.new(specification_params)
    @specification.token = SecureRandom.hex(10)

    if @specification.save
      # Envoyer l'email au client avec le token
    #   SpecificationMailer.with(specification: @specification).send_specification.deliver_now
      redirect_to dashboards_path, notice: 'Cahier des charges créé et envoyé au client.'
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
    if user_signed_in? || !token_expired?(@specification)
      render :edit
    else
      @expirate_message = 'Le cahier des charges a expiré.'
    end
  end

  def update
    if user_signed_in? || !token_expired?(@specification)
      if @specification.update(specification_params)
        redirect_to @specification, notice: 'La spécification a été mise à jour avec succès.'
      else
        render :edit
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
    params.require(:specification).permit(:title, :description, :client_email, :token_expiry)
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
