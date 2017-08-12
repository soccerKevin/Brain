class NeuronController < ApplicationController
  def index
  end

  def show
  end

  def create
    @neuron = Neuron.new name: 'brain'
    binding.pry
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def brain_params
    params.require(:neuron)
  end
end
