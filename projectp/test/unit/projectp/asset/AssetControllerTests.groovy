package projectp.asset



import org.junit.*
import grails.test.mixin.*

@TestFor(AssetController)
@Mock(Asset)
class AssetControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/asset/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.assetInstanceList.size() == 0
        assert model.assetInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.assetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.assetInstance != null
        assert view == '/asset/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/asset/show/1'
        assert controller.flash.message != null
        assert Asset.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/asset/list'


        populateValidParams(params)
        def asset = new Asset(params)

        assert asset.save() != null

        params.id = asset.id

        def model = controller.show()

        assert model.assetInstance == asset
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/asset/list'


        populateValidParams(params)
        def asset = new Asset(params)

        assert asset.save() != null

        params.id = asset.id

        def model = controller.edit()

        assert model.assetInstance == asset
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/asset/list'

        response.reset()


        populateValidParams(params)
        def asset = new Asset(params)

        assert asset.save() != null

        // test invalid parameters in update
        params.id = asset.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/asset/edit"
        assert model.assetInstance != null

        asset.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/asset/show/$asset.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        asset.clearErrors()

        populateValidParams(params)
        params.id = asset.id
        params.version = -1
        controller.update()

        assert view == "/asset/edit"
        assert model.assetInstance != null
        assert model.assetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/asset/list'

        response.reset()

        populateValidParams(params)
        def asset = new Asset(params)

        assert asset.save() != null
        assert Asset.count() == 1

        params.id = asset.id

        controller.delete()

        assert Asset.count() == 0
        assert Asset.get(asset.id) == null
        assert response.redirectedUrl == '/asset/list'
    }
}
