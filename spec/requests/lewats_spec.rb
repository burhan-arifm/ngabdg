require 'rails_helper'

RSpec.describe 'Lewat API', type: :request do
  # Inisialisasi data pengujian
  let!(:tipe_angkutan) { create(:tipe_angkutan, flat: false) }
  let!(:angkutan) { create(:angkutan, tipe_angkutan_id: tipe_angkutan.id) }
  let!(:road) { create(:road, searah: false) }
  let!(:lewats) { create_list(:lewat, 10, angkutan_id: angkutan.id, road_id: road.id) }
  let(:angkutan_id) { angkutan.id }
  let(:road_id) { road.id }
  let(:lewat_id) { lewats.first.id }

  # Kumpulan pengujian untuk fungsi GET /lewats
  describe 'fungsi GET /lewats' do
    # make HTTP get request before each example
    before { get '/lewats' }

    it 'menampilkan daftar lewat' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'mengembalikan kode status 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Kumpulan pengujian untuk fungsi GET /lewats/:id
  describe 'fungsi GET /lewats/:id' do
    before { get "/lewats/#{lewat_id}" }

    context 'ketika data tersedia' do
      it 'menampilkan lewat yang dipilih' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(lewat_id)
      end

      it 'mengembalikan kode status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'ketika data tidak tersedia' do
      let(:lewat_id) { 100 }

      it 'mengembalikan kode status 404' do
        expect(response).to have_http_status(404)
      end

      it 'menampilkan pesan data tidak ditemukan' do
        expect(response.body).to match(/Couldn't find Lewat/)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi POST /lewat
  describe 'fungsi POST /lewat' do
    # Data pengujian yang valid
    let(:valid_attributes) { { angkutan_id: angkutan_id, pulang: true, road_id: road_id, urutan: 10 } }

    context 'ketika permohonan diterima' do
      before { post '/lewats', params: valid_attributes }

      it 'menyimpan data yang dimasukan' do
        expect(json['pulang']).to eq(true)
      end

      it 'mengembalikan kode status 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'ketika permohonan ditolak' do
      before { post '/lewats', params: { angkutan_id: angkutan_id, pulang: false, road_id: road_id } }

      it 'mengembalikan kode status 422' do
        expect(response).to have_http_status(422)
      end

      it 'menampilkan pesan kegagalan validasi' do
        expect(response.body).to match(/Validation failed: Urutan can't be blank/)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi PUT /lewats/:id
  describe 'fungsi PUT /lewats/:id' do
    let(:valid_attributes) { { Pulang: false } }

    context 'ketika data ada' do
      before { put "/lewats/#{lewat_id}", params: valid_attributes }

      it 'data berhasil diperbaharui' do
        expect(response.body).to be_empty
      end

      it 'mengembalikan kode status 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi DELETE /lewats/:id
  describe 'fungsi DELETE /lewats/:id' do
    before { delete "/lewats/#{lewat_id}" }

    it 'mengemblaikan kode status 204' do
      expect(response).to have_http_status(204)
    end
  end
end