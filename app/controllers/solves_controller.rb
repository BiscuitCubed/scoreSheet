class SolvesController < ApplicationController
  before_action :set_competition
  before_action :set_competition_event
  before_action :set_competitor, except: [:index, :new]
  before_action :set_competitors
  before_action :set_round
  before_action :set_solve, only: [:show, :edit, :update, :destroy]

  # GET /solves
  # GET /solves.json
  def index
    @solves = Solve.all
  end

  # GET /solves/1
  # GET /solves/1.json
  def show

  end

  # GET /solves/new
  def new
    byebug
    @solve = @round.solves.build
    render :layout => "new"
  end

  # GET /solves/1/edit
  def edit
  end

  # POST /solves
  # POST /solves.json
  def create
    @solve = Solve.new(solve_params)

    respond_to do |format|
      if @solve.save
        format.html { redirect_to competition_competition_event_path(@competition, @competition_event), notice: 'Solve was successfully created.' }
        format.json { render :show, status: :created, location: @solve }
      else
        format.html { render :new }
        format.json { render json: @solve.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solves/1
  # PATCH/PUT /solves/1.json
  def update
    respond_to do |format|
      if @solve.update(solve_params)
        format.html { redirect_to @solve, notice: 'Solve was successfully updated.' }
        format.json { render :show, status: :ok, location: @solve }
      else
        format.html { render :edit }
        format.json { render json: @solve.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solves/1
  # DELETE /solves/1.json
  def destroy
    @solve.destroy
    respond_to do |format|
      format.html { redirect_to solves_url, notice: 'Solve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solve
      @solve = Solve.find(params[:id])
    end

    def set_competition_event
      @competition_event = @competition_event = CompetitionEvent.find(params[:competition_event_id])
    end

    def set_competitor
      @competitor = Competitor.find(params[:competitor_id])
    end

    def set_competitors
      @competitors = Competitor.all
    end

    def set_round
      @round = Round.find(params[:round_id])
    end

    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solve_params
      params.require(:solve).permit(:round_id, :competition_event_id, :solve_time, :solve_number, :status)
    end
end
