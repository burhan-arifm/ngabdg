require 'rails_helper'

RSpec.describe 'Tipe Angkutan API', type: :request do
  # Inisialisasi data pengujian
  let!(:roads) { create_list(:road, 10) }
  let(:road_id) { road.first.id }

  # Kumpulan pengujian untuk fungsi GET /roads
  describe 'fungsi GET /roads' do
    # make HTTP get request before each example
    before { get '/roads' }

    it 'menampilkan daftar road' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'mengembalikan kode status 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Kumpulan pengujian untuk fungsi GET /roads/:id
  describe 'fungsi GET /roads/:id' do
    before { get "/roads/#{road_id}" }

    context 'ketika data tersedia' do
      it 'menampilkan road yang dipilih' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(road_id)
      end

      it 'mengembalikan kode status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'ketika data tidak tersedia' do
      let(:road_id) { 100 }

      it 'mengembalikan kode status 404' do
        expect(response).to have_http_status(404)
      end

      it 'menampilkan pesan data tidak ditemukan' do
        expect(response.body).to match(/Couldn't find Road/)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi POST /road
  describe 'fungsi POST /road' do
    # Data pengujian yang valid
    let(:valid_attributes) { { nama: 'Jl. Nasional III', lat_awal: '-6.935362', long_awal: '107.717220', lat_akhir: '-6.917429', long_akhir: '107.574274', searah: false } }

    context 'ketika permohonan diterima' do
      before { post '/roads', params: valid_attributes }

      it 'menyimpan data yang dimasukan' do
        expect(json['tipe']).to eq('Angkot')
      end

      it 'mengembalikan kode status 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'ketika permohonan ditolak' do
      before { post '/roads', params: { lat_awal: '-6.935362', long_awal: '107.717220', lat_akhir: '-6.917429', long_akhir: '107.574274', searah: false } }

      it 'mengembalikan kode status 422' do
        expect(response).to have_http_status(422)
      end

      it 'menampilkan pesan kegagalan validasi' do
        expect(response.body).to match(/Validation failed: Nama can't be blank/)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi PUT /roads/:id
  describe 'fungsi PUT /roads/:id' do
    let(:valid_attributes) { { Nama: 'Jl. Cihampelas' } }

    context 'ketika data ada' do
      before { put "/roads/#{road_id}", params: valid_attributes }

      it 'data berhasil diperbaharui' do
        expect(response.body).to be_empty
      end

      it 'mengembalikan kode status 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi DELETE /roads/:id
  describe 'fungsi DELETE /roads/:id' do
    before { delete "/roads/#{road_id}" }

    it 'mengemblaikan kode status 204' do
      expect(response).to have_http_status(204)
    end
  end
end