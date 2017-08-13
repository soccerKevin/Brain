class NeuronController < ApplicationController
  layout false

  def index
  end

  def show
  end

  def create
    @neuron = Neuron.new neuron_params
    @neuron.save!
    return render 'neurons/show'
  rescue Exception => e
    render json: { errors: e.to_s, status: 400 }
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def neuron_params
    params.require(:neuron).permit!
  end
end
