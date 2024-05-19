class SpecificationMailer < ApplicationMailer
  def send_specification
    @specification = params[:specification]
    @url = specification_url(@specification, token: @specification.token)
    mail(to: @specification.client_email, subject: 'Votre cahier des charges')
  end
end
