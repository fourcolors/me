module MemoryHelpers
  def fixtures_path_for( fixture )
    File.join(::Rails.root, 'features', 'support', 'fixtures', fixture)
  end

  def create_a_memory_titled( memory_title)
    navigate_to_new_memory_page

    within("#new_memory") do
      fill_in "Title", :with => memory_title
    end

    click_on "Save then create a new moment"
  end

  def create_a_memory_with_a_story_titled( memory_title )
    navigate_to_new_memory_page

    within("#new_memory") do
      fill_in "Title", :with => memory_title
      fill_in "Story", :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    end

    click_on "Save then create a new moment"
  end

  def create_a_memory_with_an_image_titled( memory_title )
    navigate_to_new_memory_page

    within("#new_memory") do
      fill_in "Title", :with => memory_title
      attach_file 'memory_main_image', fixtures_path_for( 'small.png' )
    end

    click_on "Save then create a new moment"
  end

  def edit_a_memory_title( new_title )
    memory = Memory.first

    visit edit_memory_path memory

    within("#edit_memory_#{memory.id}") do
      fill_in "Title", :with => new_title
    end

    click_on "Update"
  end

  # Navigation Items
  def navigate_to_new_memory_page
    visit memories_path
    click_link "Create Memory"
  end
end

World(MemoryHelpers)
