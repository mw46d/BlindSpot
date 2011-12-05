class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, :notice => 'Course was successfully created.' }
        format.json { render :json => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    
    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, :notice => 'Course was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :ok }
    end
  end
  
  # GET/POST /courses/1/students
  def students
    @course = Course.find(params[:id])
    
    if request.post?
      respond_to do |format|
        if @course.update_students(params[:students])
          format.html { redirect_to :action => :show, :id => @course.id, :notice => 'Course was successfully updated.' }
          format.json { head :ok }
        else
          @course = Course.find(@course.id)
          format.html { render :action => "students" }
          format.json { render :json => @course.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  # POST /courses/1/postion (Ajax)
  def position
    @cs = CourseStudent.find(params[:course_student_id])
    
    if @cs
      @cs.position_x = params[:position_x]
      @cs.position_y = params[:position_y]
      @cs.save
      
      render :partial => "student_table_row", :locals => { :cs => @cs }
    end
  end
  
  # POST /courses/1/evaluation (Ajax)
  def evaluation
    @course = Course.find(params[:id])
    
    if request.get?
      render :partial => "evaluation_form", :locals => { :course => @course,
        :evaluation => CourseEvaluation.new }
    end
  end    
end
