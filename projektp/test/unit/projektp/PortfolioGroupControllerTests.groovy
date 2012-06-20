package projektp



import org.junit.*
import grails.test.mixin.*

@TestFor(PortfolioGroupController)
@Mock(PortfolioGroup)
class PortfolioGroupControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/portfolioGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.portfolioGroupInstanceList.size() == 0
        assert model.portfolioGroupInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.portfolioGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.portfolioGroupInstance != null
        assert view == '/portfolioGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/portfolioGroup/show/1'
        assert controller.flash.message != null
        assert PortfolioGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/portfolioGroup/list'


        populateValidParams(params)
        def portfolioGroup = new PortfolioGroup(params)

        assert portfolioGroup.save() != null

        params.id = portfolioGroup.id

        def model = controller.show()

        assert model.portfolioGroupInstance == portfolioGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/portfolioGroup/list'


        populateValidParams(params)
        def portfolioGroup = new PortfolioGroup(params)

        assert portfolioGroup.save() != null

        params.id = portfolioGroup.id

        def model = controller.edit()

        assert model.portfolioGroupInstance == portfolioGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/portfolioGroup/list'

        response.reset()


        populateValidParams(params)
        def portfolioGroup = new PortfolioGroup(params)

        assert portfolioGroup.save() != null

        // test invalid parameters in update
        params.id = portfolioGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/portfolioGroup/edit"
        assert model.portfolioGroupInstance != null

        portfolioGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/portfolioGroup/show/$portfolioGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        portfolioGroup.clearErrors()

        populateValidParams(params)
        params.id = portfolioGroup.id
        params.version = -1
        controller.update()

        assert view == "/portfolioGroup/edit"
        assert model.portfolioGroupInstance != null
        assert model.portfolioGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/portfolioGroup/list'

        response.reset()

        populateValidParams(params)
        def portfolioGroup = new PortfolioGroup(params)

        assert portfolioGroup.save() != null
        assert PortfolioGroup.count() == 1

        params.id = portfolioGroup.id

        controller.delete()

        assert PortfolioGroup.count() == 0
        assert PortfolioGroup.get(portfolioGroup.id) == null
        assert response.redirectedUrl == '/portfolioGroup/list'
    }
}
