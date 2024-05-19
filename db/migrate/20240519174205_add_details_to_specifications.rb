class AddDetailsToSpecifications < ActiveRecord::Migration[7.0]
  def change
    add_column :specifications, :enseigne, :string
    add_column :specifications, :raison_sociale, :string
    add_column :specifications, :forme_juridique, :string
    add_column :specifications, :activite, :string
    add_column :specifications, :rcs, :string
    add_column :specifications, :code_ape, :string
    add_column :specifications, :siret, :string
    add_column :specifications, :siren, :string
    add_column :specifications, :tva_intra, :string
    add_column :specifications, :adresse_societe, :string
    add_column :specifications, :ville_societe, :string
    add_column :specifications, :cp_societe, :string
    add_column :specifications, :tel_societe, :string
    add_column :specifications, :mail_societe, :string
    add_column :specifications, :nom_gerant, :string
    add_column :specifications, :prenom_gerant, :string
    add_column :specifications, :tel_gerant, :string
    add_column :specifications, :gsm_gerant, :string
    add_column :specifications, :mail_gerant, :string
    add_column :specifications, :nom_responsable, :string
    add_column :specifications, :prenom_responsable, :string
    add_column :specifications, :tel_responsable, :string
    add_column :specifications, :gsm_responsable, :string
    add_column :specifications, :mail_responsable, :string
    add_column :specifications, :prevu_ouverture, :datetime
    add_column :specifications, :prevu_installation, :datetime
  end
end
