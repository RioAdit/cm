<div class="ibox">
	<div class="ibox-title">
		<h4>Note</h4>
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
	<div id="showNote" class="ibox-content">
		<?php foreach ($note as $n) { ?>
			<div>
				<?= $n->tgl_note ?> WIB<br><?= $n->note ?>
                <a id="btnDelNote" class="close-link float-right" data-idnote="<?= $n->idnote ?>">
					<i class="fa fa-times"></i>
				</a>
                <hr/>
            </div>
		<?php } ?>
		<!-- <textarea id="Snote" name="Snote" class="noToolbar"></textarea> -->
	</div>
</div>
