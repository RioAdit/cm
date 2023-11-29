<div class="ibox">
	<div class="ibox-title">
		<h4>Activity</h4>
		<!-- <div class="ibox-tools">
		            <a class="collapse-link">
		                <i class="fa fa-chevron-up"></i>
		            </a>
		            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		                <i class="fa fa-wrench"></i>
		            </a>
		            <ul class="dropdown-menu dropdown-user">
		                <li>
		                    <a href="#" class="dropdown-item">Edit</a>
		                </li>
		                <li>
		                    <a href="#" class="dropdown-item">Hapus</a>
		                </li>
		            </ul>
		            <a class="close-link">
		                <i class="fa fa-times"></i>
		            </a>
		        </div> -->
	</div>
	<div id="showAct" class="ibox-content">
		{% for a in act %}
			<div>
				<strong>{{a.judul_act}}</strong><br>
                <a id="btnDelAct" class="close-link float-right" data-idact="{{a.idact}}">
					<i class="fa fa-times"></i>
				</a>
                {{a.tgl_act}}
				|
				{{a.jam_act}}
				WIB<br>{{a.note_act}}
				
				<hr/>
			</div>
		{% endfor %}
		<!-- <input id="Sact" name="Sact" class="form-control-plaintext" readonly disabled></input> -->
	</div>
</div>
