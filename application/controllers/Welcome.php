<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Welcome extends CI_Controller
{


	function __construct()
	{
		parent::__construct();
		$this->load->model(array('Kelompok_model', 'Nilaicf_model', 'Gejala_model', 'History_model', 'Riwayat_model'));
		// if($this->session->userdata('is_login') == FALSE){redirect('login_user');}
	}

	public function admin()
	{
		// $data['content'] = 'admin/dashboard'; //nama file yang akan jadi kontent di template

		$this->load->view('templates/login/index');
	}

	public function index()
	{
		$data['contentuser'] = 'user/home'; //nama file yang akan jadi kontent di template
		$this->load->view('templates/user/home/index', $data);
	}

	public function afterlogin()
	{
		$data['contentuser'] = 'user/home'; //nama file yang akan jadi kontent di template
		$this->load->view('templates/user/diagnosa/index', $data);
	}

	public function diagnosa()
	{

		// $user_login = $this->session->userdata('user_id');
		// if($this->session->userdata('is_login') == FALSE){redirect('login_user');}

		if (!$this->input->post('gejala')) {

			$data['contentuser'] = 'user/diagnosa'; //nama file yang akan jadi kontent di template
			$data['listKelompok'] = $this->Kelompok_model->get_list_data();
			$this->load->view('templates/user/diagnosa/index', $data);
		} else {
			$MdGejala = array();
			foreach ($this->input->post('gejala') as $g) {
				$x = explode("_", $g);
				if ($x[1] > 0) {
					$MdGejala[$x[0]] = $x[1];
				}
			}

			$data["contentuser"] = "user/hasil_diagnosa";
			// $gejala = implode(",", $this->input->post("gejala"));
			$gejala = implode(', ',array_keys($MdGejala));
			$data["listGejala"] = $this->Gejala_model->get_list_by_id($gejala);
			//hitung
			$listPenyakit = $this->Nilaicf_model->get_by_gejala($gejala);
			$penyakit = array();
			$i = 0;
			foreach ($listPenyakit->result() as $value) {
				$listGejala = $this->Nilaicf_model->get_gejala_by_penyakit($value->penyakit_id, $gejala);
				$cf1 = 0;
				$cfOld = 0;
				$cfCombine = 0;
				$j = 0;
				foreach ($listGejala->result() as $value2) {
					if ($j == 0) {
						$cf1 = $value2->mb;
					} else if ($j == 1) {
						$cfOld = $cf1 + ($value2->mb * (1 - $cf1));
						$cfCombine = $cfOld;
					} else {
						$cfCombine = $cfOld + (($value2->mb * $MdGejala[$value2->gejala_id]) * (1 - $cfOld));
					}
					$j++;
				}
				$penyakit[] = array(
					'kode' => $value->kode,
					'nama' => $value->nama,
					'keterangan' => $value->keterangan,
					'kepercayaan' => $cfCombine * 100
				);
			}

			$data_hasil = array();
			$kepercayaanTerbesar = $penyakit[0]['kepercayaan'];
			foreach ($penyakit as $p) {
				if ($p['kepercayaan'] >= $kepercayaanTerbesar) {
					$data_hasil = $p;
					$kepercayaanTerbesar = $p['kepercayaan'];
				}
			}

			//insert ke tabel history
			$insert_data = array();
			foreach ($this->input->post("gejala") as $g) {
				$insert_data[] = array(
					// 'user_id' => $user_login,
					'gejala_id' => $g
				);
			}
			// $this->db->insert_batch('history', $insert_data);
			$data['dataHasil'] = $data_hasil;
			$data["listPenyakit"] = $penyakit;
			$this->db->insert('hasil_diagnosa', $data_hasil);
			$this->load->view('templates/user/diagnosa/index', $data);
		}
	}

	public function dashboard()
	{
		if ($this->session->userdata('is_login') == FALSE || $this->session->userdata('level') != 'admin') {
			redirect('welcome/admin');
		}

		$data = array(
			'jumlah_users' => $this->db->get('user')->result(),
			'jumlah_kelompok_gejala' => $this->db->get('kelompok_gejala')->result(),
			'jumlah_gejala' => $this->db->get('gejala')->result(),
			'jumlah_penyakit' => $this->db->get('penyakit')->result(),

			'content' => 'admin/dashboard',  //nama file yang akan jadi kontent di template
		);
		// $data['jumlah_users'] = $this->db->get('admin')->result();
		// $data['jumlah_kelompok_gejala'] = $this->db->get('kelompok_gejala')->result();
		// $data['jumlah_gejala'] = $this->db->get('gejala')result();
		// $data['jumlah_penyakit'] = $this->db->get('penyakit')->result();
		// // $data['jumlah_nilai_cf'] = $this->db->get('gejala_penyakit')->result();
		// // $data['jumlah_hasil'] = $this->Riwayat_model->jumlah();

		// $data['content'] = 'admin/dashboard';  //nama file yang akan jadi kontent di template
		$this->load->view('templates/admin/index', $data);
	}

	public function riwayat()
	{
		$id = $this->session->userdata('user_id');


		$data['listHistory'] = $this->History_model->listHistory($id);
		$data['listHasil'] = $this->History_model->listHasil($id);
		// $this->load->view('user/riwayat');
		$data['contentuser'] = 'user/riwayat';
		$this->load->view('templates/user/diagnosa/index', $data);
	}
}
