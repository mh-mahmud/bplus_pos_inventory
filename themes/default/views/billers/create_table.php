<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-users"></i><?= lang('create_table'); ?></h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <p class="introtext"><?php echo lang('create_table'); ?></p>

                <!-- <form method="POST" action="<?php //echo base_url() ?>billers/create_table"> -->
                <!-- <input type="hidden" name="token" value="745e5402b315f26cc42f82cf99eb5e46" style="display:none;" /> -->
                <?php $attrib = array( 'role' => 'form');
                echo form_open("billers/create_table", $attrib);
                ?>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-5">
                            <div class="form-group">
                                Table Name
                                <div class="controls">
                                    <?php //echo form_input('first_name', '', 'class="form-control" id="first_name" required="required" pattern=".{3,10}"'); ?>
                                    <input type="text" name="table_name" class="form-control" value="" required>
                                </div>
                            </div>

                            <div class="form-group">
                                Table Description
                                <div class="controls">
                                    <textarea name="table_desc"></textarea>
                                </div>
                            </div>
                            <p><input name="submit" value="Create Table" class="btn btn-primary" type="submit"></p>
                        </div>
                    </div>
                </div>

                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>