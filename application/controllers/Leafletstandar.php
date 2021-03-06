<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Leafletstandar extends CI_Controller {

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
		$datacontent['url']='leafletstandar';
		$datacontent['title']='Halaman Leaflet Standar';
		// $datacontent['datatable']=$this->Model->get();
		$data['content']=$this->load->view('leafletstandar/mapsView',$datacontent,TRUE);
		$data['js']=$this->load->view('leafletstandar/js/mapJs',$datacontent,TRUE);
		$data['title']=$datacontent['title'];
		$this->load->view('layouts/html',$data);
	}

}
