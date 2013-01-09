class RecordsController < ApplicationController

  def show
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end
  
  # POST /lists
  # POST /lists.json
  def create
    @record = Record.new(params[:record])
    respond_to do |format|
      if @record.save
	Record.set_priority @record.list_id
	format.json { render json: @record, status: :created, location: @record }
      else
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lists/1
  # PUT /lists/1.json
  def update
    @record = Record.find(params[:id])
       
    respond_to do |format|
      if @record.update_attributes(params[:record])
        Record.set_priority @record.list_id
	format.html { redirect_to @record, notice: 'List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @record = Record.find(params[:id])
    list_id = @record.list_id 
    @record.destroy
    Record.set_priority list_id
    respond_to do |format|
       format.json { head :no_content }
    end
  end
end
