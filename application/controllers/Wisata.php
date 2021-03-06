<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Wisata extends CI_Controller {

	public function __construct(){
		parent::__construct();
		if($this->session->logged!==true){
	      redirect('auth');
	    }
		$this->load->model('WisataModel','Model');
		$this->load->model('KecamatanModel');
	}

	public function index()
	{
		$datacontent['url']='wisata';
		$datacontent['title']='Halaman Tempat Wisata';
		$datacontent['datatable']=$this->Model->get();
		$data['content']=$this->load->view('wisata/tabelView',$datacontent,TRUE);
		$data['title']=$datacontent['title'];
		$this->load->view('layouts/html',$data);
	}
	public function form($parameter='',$id='')
	{
		$datacontent['url']='wisata';
		$datacontent['parameter']=$parameter;
		$datacontent['id']=$id;
		$datacontent['title']='Form Tempat Wisata';
		$data['content']=$this->load->view('wisata/formView',$datacontent,TRUE);
		$data['js']=$this->load->view('wisata/js/formJs',$datacontent,TRUE);
		$data['title']=$datacontent['title'];
		$this->load->view('layouts/html',$data);
	}
	public function simpan()
	{
		if($this->input->post()){
			$data=[
				'id_kecamatan'=>$this->input->post('id_kecamatan'),
				'nm_wisata'=>$this->input->post('nm_wisata'),
				'lokasi'=>$this->input->post('lokasi'),
				'lat'=>$this->input->post('lat'),
				'lng'=>$this->input->post('lng'),
			];
			// upload marker
			if($_FILES['marker']['name']!=''){
				$upload=upload('marker','marker','image');
				if($upload['info']==true){
					$data['marker']=$upload['upload_data']['file_name'];
				}
				elseif($upload['info']==false){
					$info='<div class="alert alert-danger alert-dismissible">
	            		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	            		<h4><i class="icon fa fa-ban"></i> Error!</h4> '.$upload['message'].' </div>';
					$this->session->set_flashdata('info',$info);
					redirect('wisata');
					exit();
				}
			}
			// upload
			
			if($_POST['parameter']=="tambah"){
				$this->Model->insert($data);
			}
			else{
				$this->Model->update($data,['id_wisata'=>$this->input->post('id_wisata')]);
			}

		}
		redirect('wisata');
	}

public function importcsv(){
		if($this->input->post()){
			if($_FILES['csv']['name']!=''){
				$getKecamatan=$this->KecamatanModel->get();
				$id_kecamatan=[];
				foreach ($getKecamatan->result() as $row) {
					$id_kecamatan[strtolower($row->nm_kecamatan)]=$row->id_kecamatan;
				}
				// print_r($id_kecamatan);

				$upload=upload('csv','csv','csv');
				if($upload['info']==true){
					$filename=$upload['upload_data']['file_name'];
					$file=FCPATH.'assets/unggah/csv/'.$filename;
					$csv = array_map('str_getcsv', file($file));
					foreach ($csv as $row) {
						$data[]=[
							'id_kecamatan'=>$id_kecamatan[strtolower($row[2])],
							'nm_wisata'=>$row[3],
							'lokasi'=>$row[1],
							'lat'=>$row[4],
							'lng'=>$row[5],
						];
					}
					$this->Model->insert_batch($data);
					unlink($file);
					$info='<div class="alert alert-success alert-dismissible">
				            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				            <h4><i class="icon fa fa-check"></i> Sukses!</h4> Import data dari CSV sukses </div>';
				}
				elseif($upload['info']==false){
					$info='<div class="alert alert-danger alert-dismissible">
	            		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	            		<h4><i class="icon fa fa-ban"></i> Error!</h4> '.$upload['message'].' </div>';
				}
			}
			else{
				$info='<div class="alert alert-danger alert-dismissible">
	            		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	            		<h4><i class="icon fa fa-ban"></i> Error!</h4> Tidak ada file CSV yang diunggah</div>';
			}
		}
		$this->session->set_flashdata('info',$info);
		redirect('wisata');
	}



	public function hapus($id=''){
		// hapus file di dalam folder
		$this->db->where('id_wisata',$id);
		$get=$this->Model->get()->row();
		$geojson_wisata=$get->geojson_wisata;
		unlink('assets/unggah/geojson/'.$geojson_wisata);
		// end hapus file di dalam folder
		$this->Model->delete(["id_wisata"=>$id]);
		redirect('wisata');
	}
}
