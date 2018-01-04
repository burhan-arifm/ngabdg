require 'rails_helper'

RSpec.describe 'Angkutan API', type: :request do
  # Inisialisasi data pengujian
  let!(:tipe_angkutan) { create(:tipe_angkutan, flat: false) }
  let!(:angkutans) { create_list(:angkutan, 10, tipe_angkutan_id: tipe_angkutan.id) }
  let(:tipe_angkutan_id) { tipe_angkutan.id }
  let(:angkutan_id) { angkutans.first.id }

  # Kumpulan pengujian untuk fungsi GET /angkutans
  describe 'fungsi GET /angkutans' do
    # make HTTP get request before each example
    before { get '/angkutans' }

    it 'menampilkan daftar angkutan' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'mengembalikan kode status 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Kumpulan pengujian untuk fungsi GET /angkutans/:id
  describe 'fungsi GET /angkutans/:id' do
    before { get "/angkutans/#{angkutan_id}" }

    context 'ketika data tersedia' do
      it 'menampilkan angkutan yang dipilih' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(angkutan_id)
      end

      it 'mengembalikan kode status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'ketika data tidak tersedia' do
      let(:angkutan_id) { 100 }

      it 'mengembalikan kode status 404' do
        expect(response).to have_http_status(404)
      end

      it 'menampilkan pesan data tidak ditemukan' do
        expect(response.body).to match(/Couldn't find Angkutan/)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi POST /angkutan
  describe 'fungsi POST /angkutan' do
    # Data pengujian yang valid
    let(:valid_attributes) { { plat_nomor: 'D4984MA', rute_awal: 'Majalaya', jalur: 'Sayang', rute_akhir: 'Gedebage', tipe_angkutan_id: tipe_angkutan_id } }

    context 'ketika permohonan diterima' do
      before { post '/angkutans', params: valid_attributes }

      it 'menyimpan data yang dimasukan' do
        expect(json['plat_nomor']).to eq('D4984MA')
      end

      it 'mengembalikan kode status 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'ketika permohonan ditolak' do
      before { post '/angkutans', params: { plat_nomor: 'D1234MS', rute_awal: 'Caringin', rute_akhir: 'Sadang Serang', tipe_angkutan_id: tipe_angkutan_id } }

      it 'mengembalikan kode status 422' do
        expect(response).to have_http_status(422)
      end

      it 'menampilkan pesan kegagalan validasi' do
        expect(response.body).to match(/Validation failed: Jalur can't be blank/)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi PUT /angkutans/:id
  describe 'fungsi PUT /angkutans/:id' do
    let(:valid_attributes) { { plat_nomor: 'D3153DA' } }

    context 'ketika data ada' do
      before { put "/angkutans/#{angkutan_id}", params: valid_attributes }

      it 'data berhasil diperbaharui' do
        expect(response.body).to be_empty
      end

      it 'mengembalikan kode status 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Kumpulan pengujian untuk fungsi DELETE /angkutans/:id
  describe 'fungsi DELETE /angkutans/:id' do
    before { delete "/angkutans/#{angkutan_id}" }

    it 'mengembalikan kode status 204' do
      expect(response).to have_http_status(204)
    end
  end
end