require 'rails_helper'

RSpec.describe 'Tipe Angkutan API', type: :request do
  # Inisialisasi data pengujian
  let!(:tipe_angkutans) { create_list(:tipe_angkutan, 10) }
  let(:tipe_angkutan_id) { tipe_angkutan.first.id }

  # Kumpulan pengujian untuk fungsi GET /tipe_angkutans
  describe 'fungsi GET /tipe_angkutans' do
    # make HTTP get request before each example
    before { get '/tipe_angkutans' }

    it 'menampilkan daftar tipe angkutan' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'mengembalikan kode status 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Kumpulan pengujian untuk fungsi GET /tipe_angkutans/:id
  describe 'fungsi GET /tipe_angkutans/:id' do
    before { get "/tipe_angkutans/#{tipe_angkutan_id}" }

    context 'ketika data tersedia' do
      it 'menampilkan tipe angkutan yang dipilih' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(tipe_angkutan_id)
      end

      it 'mengembalikan kode status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'ketika data tidak tersedia' do
      let(:tipe_angkutan_id) { 100 }

      it 'mengembalikan kode status 404' do
        expect(response).to have_http_status(404)
      end

      it 'menampilkan pesan data tidak ditemukan' do
        expect(response.body).to match(/Couldn't find Tipe Angkutan/)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi POST /tipe_angkutan
  describe 'fungsi POST /tipe_angkutan' do
    # Data pengujian yang valid
    let(:valid_attributes) { { tipe: 'Angkot', ongkos: '3', flat: false } }

    context 'ketika permohonan diterima' do
      before { post '/tipe_angkutans', params: valid_attributes }

      it 'menyimpan data yang dimasukan' do
        expect(json['tipe']).to eq('Angkot')
      end

      it 'mengembalikan kode status 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'ketika permohonan ditolak' do
      before { post '/tipe_angkutans', params: { tipe: 'Pesawat Terbang', flat: true } }

      it 'mengembalikan kode status 422' do
        expect(response).to have_http_status(422)
      end

      it 'menampilkan pesan kegagalan validasi' do
        expect(response.body).to match(/Validation failed: Ongkos can't be blank/)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi PUT /tipe_angkutans/:id
  describe 'fungsi PUT /tipe_angkutans/:id' do
    let(:valid_attributes) { { tipe: 'Angkot' } }

    context 'ketika data ada' do
      before { put "/tipe_angkutans/#{tipe_angkutan_id}", params: valid_attributes }

      it 'data berhasil diperbaharui' do
        expect(response.body).to be_empty
      end

      it 'mengembalikan kode status 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi DELETE /tipe_angkutans/:id
  describe 'fungsi DELETE /tipe_angkutans/:id' do
    before { delete "/tipe_angkutans/#{tipe_angkutan_id}" }

    it 'mengemblaikan kode status 204' do
      expect(response).to have_http_status(204)
    end
  end
end