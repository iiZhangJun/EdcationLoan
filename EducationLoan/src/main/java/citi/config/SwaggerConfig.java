package citi.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


@Configuration
@EnableSwagger2
public class SwaggerConfig {
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                // 指定构建 API 文档的详细信息的方法 apiInfo()
                .apiInfo(apiInfo())
                .select()
                // 指定要生成 API 接口的包路径，这里把 controller 作为包路径，生成 controller 中的所有接口
                .apis(RequestHandlerSelectors.basePackage("citi.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    /**
     * 构建 API 文档的详细信息
     * @return
     */
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                // 设置页面标题
                .title("EducationLoan")
                // 设置接口描述
                .description("优学贷后台管理")
                // 设置联系方式
                .contact("XJTU，" + "微信公众号：xxxx")
                // 设置版本
                .version("1.0")
                // 构建
                .build();
    }
}
