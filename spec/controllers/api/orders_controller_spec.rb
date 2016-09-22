require 'rails_helper'

RSpec.describe Api::OrdersController, type: :controller do
  it { should route(:post, 'api/orders').to(action: :create) }

    describe '#create.json' do
    #   def create
    #     available_quantity = StorageItem.where(
    #                       product_id: resource_params[:product_id]).sum(:quantity)
    #     if available_quantity < resource_params[:quantity].to_i
    #       head :precondition_failed
    #       return
    #     end

    #     build_resource

    #     resource.save!

    #   end

    # def build_resource
    #   @order = Order.new resource_params
    # end

    # def resource
    #   @order ||= Order.find(params[:id])
    # end

    # def resource_params
    #   params.require(:order).permit(:product_id, :quantity, :status)
    # end

    let(:params) { { order: { product_id: '1', quantity: '10' } } }

    context 'available' do
      before do
        expect(StorageItem).to receive(:where).with(product_id: '1') do
          double.tap { |a| expect(a).to receive(:sum).with(:quantity).and_return(10) }
        end
      end

      let(:resource) { stub_model Order }

      before { expect(Order).to receive(:new).with(
        permit!(product_id: '1', quantity: '10')).and_return(resource) }

      before { expect(resource).to receive(:save!) }

      before { post :create, params: params, format: :json }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'not available' do
      before do
        expect(StorageItem).to receive(:where).with(product_id: '1') do
          double.tap { |a| expect(a).to receive(:sum).with(:quantity).and_return(9) }
        end
      end

      before { post :create, params: params, format: :json }

      it { expect(response).to have_http_status(:precondition_failed) }
    end
  end

  describe '#collection' do
    let(:params) { { page: 5 } }

    before { expect(subject).to receive(:params).and_return(params) }

    before do
      expect(Order).to receive(:page).with(5) do
        double.tap { |a| expect(a).to receive(:per).with(5) }
      end
    end

    it { expect { subject.send :collection }.to_not raise_error }
  end

end
